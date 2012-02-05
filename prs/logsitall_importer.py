import sys
import mechanize

def import_scores(email, password):    
    br = mechanize.Browser()
    
    print 'Open main page...'
    br.open('http://www.logsitall.com/login_new.asp?l=12')
    
    print 'Populate login form...'
    br.select_form(name='login')
    # Browser passes through unknown attributes (including methods)
    # to the selected HTMLForm.
    br['pr_email'] = email
    br['pr_pword'] = password
    
    # Submit current form.  Browser calls .close() on the current response on
    # navigation, so this closes response
    print 'Submit login form...'
    response = br.submit()
    
    print 'Iterate over links searching for the charts link...'
    for link in br.links(url_regex='log_detail_viz.asp'):
        print link.text
        print 'Follow link to charts page'
        response = br.follow_link(link)  # takes EITHER Link instance OR keyword args
        
    # Select activity
    print "Selecting 'Crossfit Load' activity..."
    br.select_form(name='activity_select')
    br['activity'] = ['21'] # Crossfit Load
    response = br.submit()
    
    print 'Write charts page with Crossfit Load to file...'
    open('3.html', 'w').write(response.read())
    
    
if __name__ == '__main__':
    import_scores(*sys.argv[1:])
    print 'done.'
