From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Wed, 21 Jan 2004 19:25:11 +0000
Subject: [Kernel-janitors] Re: [PATCH] /drivers/isdn/pcbit/layer2.{c,
Message-Id: <20040121112511.50242895.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 22 Jan 2004 02:37:52 +0800 Eugene Teo <eugene.teo@eugeneteo.net> wrote:

| Patch compiles, and tested. Straight-forward. 

How did you compile and test this?
I have problems building with CONFIG_ISDN set.  Other <obsolete>
files won't build (like isdn_common.c).

And this driver depends on CONFIG_ISDN (Old ISDN4Linux), which
is Obsolete.  So I'm wondering if or why we care about
fixing it up... ?

In general, the changes are good IMO.  But why?


moving to current mailing list also .........

| 
|  layer2.c |   30 ++++++------------------------
|  layer2.h |   10 +++-------
|  2 files changed, 9 insertions(+), 31 deletions(-)
| 
| -------------------------------------------------------
| The SF.Net email is sponsored by EclipseCon 2004
| Premiere Conference on Open Tools Development and Integration
| See the breadth of Eclipse activity. February 3-5 in Anaheim, CA.
| http://www.eclipsecon.org/osdn
| _______________________________________________
| Kernel-janitor-discuss mailing list
| Kernel-janitor-discuss@lists.sourceforge.net
| https://lists.sourceforge.net/lists/listinfo/kernel-janitor-discuss


--
~Randy
kernel-janitors project:  http://janitor.kernelnewbies.org/
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
