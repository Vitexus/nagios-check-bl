nagios-check-bl
===============

Nagios check_bl plugin (C)Copyright 2005 Bashton Ltd
----------------------------------------------------

A Nagios plugin to check whether a server is in any known anti-spam
blocklists.  Licensed under the GNU GPL v2.0 or later (at your option).  For
full copyright and warranty details, please see the COPYING file included in
this package.

By Sam Bashton, Bashton Ltd - sam@bashton.com www.bashton.com

Comments, bug reports etc are welcome.

Pre-Requisites
--------------

- Working Nagios install
- Perl 5 (tested with Perl 5.6.1 and 5.8)
- Net::DNS Perl library and associated dependencies

Installation
------------

- Copy to your nagios plugins directory (possibly /usr/lib/nagios/plugins)
- Add the following to your checkcommands.cfg:

define command{
        command_name    check_bl
        command_line    $USER1$/check_bl -H $HOSTADDRESS$ -B sbl-xbl.spamhaus.org,bl.spamcop.net,t1.dnsbl.net.au
}

- Alter your services.cfg to include a check against the check_bl command

Variables
---------

check_bl requires the following variables:

-H host : Hostname to check
-B blacklist1,blacklist2 : Comma separated list of blacklists to check against

The following optional variable is also available:

-c critnum : Number of blacklists the server must be listed in before the status is 'critical'.  By default, any listing is regarded as critical.
