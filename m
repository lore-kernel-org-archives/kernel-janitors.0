From: "J. Bruce Fields" <bfields@fieldses.org>
Date: Fri, 06 Nov 2020 20:59:59 +0000
Subject: Re: [PATCH] net/sunrpc: clean up error checking in proc_do_xprt()
Message-Id: <20201106205959.GB26028@fieldses.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <031F93AC-744F-4E02-9948-1C1F5939714B@gmail.com>
 <20201027141758.GA3488087@mwanda>
 <20201106203316.GA26028@fieldses.org>
In-Reply-To: <20201106203316.GA26028@fieldses.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Trond Myklebust <trond.myklebust@hammerspace.com>, Artur Molchanov <arturmolchanov@gmail.com>, Anna Schumaker <anna.schumaker@netapp.com>, Chuck Lever <chuck.lever@oracle.com>, Jakub Kicinski <kuba@kernel.org>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org, Colin King <colin.king@canonical.com>

On Fri, Nov 06, 2020 at 03:33:16PM -0500, J. Bruce Fields wrote:
> On Tue, Oct 27, 2020 at 05:17:58PM +0300, Dan Carpenter wrote:
> > There are three changes but none of them should affect run time:
> > 
> > 1)  You can't write to this file because the permissions are 0444.  But
> >     it sort of looked like you could do a write and it would result in
> >     a read.  Then it looked like proc_sys_call_handler() just ignored
> >     it.  Which is confusing.  It's more clear if the "write" just
> >     returns zero.
> > 2)  The "lenp" pointer is never NULL so that check can be removed.
> > 3)  In the original code, the "if (*lenp < 0)" check didn't work because
> >     "*lenp" is unsigned.  Fortunately, the memory_read_from_buffer()
> >     call will never fail in this context so it doesn't affect runtime.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  net/sunrpc/sysctl.c | 18 +++++++++---------
> >  1 file changed, 9 insertions(+), 9 deletions(-)
> > 
> > diff --git a/net/sunrpc/sysctl.c b/net/sunrpc/sysctl.c
> > index a18b36b5422d..04526bab4a06 100644
> > --- a/net/sunrpc/sysctl.c
> > +++ b/net/sunrpc/sysctl.c
> > @@ -63,19 +63,19 @@ static int proc_do_xprt(struct ctl_table *table, int write,
> >  			void *buffer, size_t *lenp, loff_t *ppos)
> >  {
> >  	char tmpbuf[256];
> > -	size_t len;
> > +	ssize_t len;
> >  
> > -	if ((*ppos && !write) || !*lenp) {
> > -		*lenp = 0;
> > +	*lenp = 0;
> > +
> > +	if (write || *ppos)
> >  		return 0;
> > -	}
> > +
> >  	len = svc_print_xprts(tmpbuf, sizeof(tmpbuf));
> > -	*lenp = memory_read_from_buffer(buffer, *lenp, ppos, tmpbuf, len);
> > +	len = memory_read_from_buffer(buffer, *lenp, ppos, tmpbuf, len);
> 
> Except now we're passing *lenp = 0, that can't be right.
> 
> Though I actually kind of prefer this to Colin King's patch which just
> casts (*lenp) in the comparison below.

So, maybe just leave all the ugly *lenp = 0's and otherwise keep your
version:

commit d435c05ab019
Author: Dan Carpenter <dan.carpenter@oracle.com>
Date:   Fri Nov 6 15:39:50 2020 -0500

    net/sunrpc: return 0 on attempt to write to "transports"
    
    You can't write to this file because the permissions are 0444.  But
    it sort of looked like you could do a write and it would result in
    a read.  Then it looked like proc_sys_call_handler() just ignored
    it.  Which is confusing.  It's more clear if the "write" just
    returns zero.
    
    Also, the "lenp" pointer is never NULL so that check can be removed.
    
    Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
    Signed-off-by: J. Bruce Fields <bfields@redhat.com>

diff --git a/net/sunrpc/sysctl.c b/net/sunrpc/sysctl.c
index a18b36b5422d..5c9f5bca4d99 100644
--- a/net/sunrpc/sysctl.c
+++ b/net/sunrpc/sysctl.c
@@ -65,7 +65,7 @@ static int proc_do_xprt(struct ctl_table *table, int write,
 	char tmpbuf[256];
 	size_t len;
 
-	if ((*ppos && !write) || !*lenp) {
+	if (write || *ppos) {
 		*lenp = 0;
 		return 0;
 	}

commit bfb5aa1685d5
Author: Dan Carpenter <dan.carpenter@oracle.com>
Date:   Fri Nov 6 15:50:39 2020 -0500

    net/sunrpc: fix useless comparison in proc_do_xprt()
    
    In the original code, the "if (*lenp < 0)" check didn't work because
    "*lenp" is unsigned.  Fortunately, the memory_read_from_buffer() call
    will never fail in this context so it doesn't affect runtime.
    
    Signed-off-by: J. Bruce Fields <bfields@redhat.com>

diff --git a/net/sunrpc/sysctl.c b/net/sunrpc/sysctl.c
index 5c9f5bca4d99..3aad6ef18504 100644
--- a/net/sunrpc/sysctl.c
+++ b/net/sunrpc/sysctl.c
@@ -63,19 +63,20 @@ static int proc_do_xprt(struct ctl_table *table, int write,
 			void *buffer, size_t *lenp, loff_t *ppos)
 {
 	char tmpbuf[256];
-	size_t len;
+	ssize_t len;
 
 	if (write || *ppos) {
 		*lenp = 0;
 		return 0;
 	}
 	len = svc_print_xprts(tmpbuf, sizeof(tmpbuf));
-	*lenp = memory_read_from_buffer(buffer, *lenp, ppos, tmpbuf, len);
+	len = memory_read_from_buffer(buffer, *lenp, ppos, tmpbuf, len);
 
-	if (*lenp < 0) {
+	if (len < 0) {
 		*lenp = 0;
 		return -EINVAL;
 	}
+	*lenp = len;
 	return 0;
 }
