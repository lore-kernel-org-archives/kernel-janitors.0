From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 17 Nov 2014 19:58:49 +0000
Subject: Re: exit: reparent: cleanup the changing of ->parent
Message-Id: <20141117195849.GG4905@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141114085410.GA9293@mwanda>
In-Reply-To: <20141114085410.GA9293@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Nov 17, 2014 at 07:42:28PM +0100, Oleg Nesterov wrote:
> On 11/14, Dan Carpenter wrote:
> >
> > The patch eb6d8479b73d: "exit: reparent: cleanup the changing of
> > ->parent" from Nov 13, 2014, leads to the following static checker
> > warning:
> >
> > 	kernel/exit.c:543 forget_original_parent()
> > 	warn: add some parenthesis here?
> >
> > kernel/exit.c
> >    538          /* Can drop and reacquire tasklist_lock */
> >    539          reaper = find_new_reaper(father);
> >    540          list_for_each_entry(p, &father->children, sibling) {
> >    541                  for_each_thread(p, t) {
> >    542                          t->real_parent = reaper;
> >    543                          BUG_ON(!t->ptrace != (t->parent = father));
> >                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >
> > The reason for this warning is that many people forget that ! is higher
> > precedence than =.
> 
> Do you really think we should try to shut up this warning?
> 
> IMO this warning is wrong, "!A = B" or "!A != B" looks fine to me...
> 

Most of the time when Smatch prints a warning about those then it's a
bug.  It's a mix of precedence bugs and adding accidental negates.

I'll send a patch to put some parenthesis around the negate.

regards,
dan carpenter

