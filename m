From: Emil Goode <emilgoode@gmail.com>
Date: Mon, 23 Apr 2012 18:12:54 +0000
Subject: Re: [PATCH] staging: android: binder: fix some sparse warnings and long lines
Message-Id: <1335204774.2570.7.camel@debian>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1335201824-17879-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1335201824-17879-1-git-send-email-emilgoode@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Hello Marcos,

Sorry, here are the sparse warnings that the patch fixes:

drivers/staging/android/binder.c:1603:76: warning: incorrect type in
argument 2 (different address spaces)
drivers/staging/android/binder.c:1603:76:    expected void [noderef]
<asn:1>*ptr
drivers/staging/android/binder.c:1603:76:    got void *binder
drivers/staging/android/binder.c:1605:64: warning: incorrect type in
argument 2 (different address spaces)
drivers/staging/android/binder.c:1605:64:    expected void [noderef]
<asn:1>*ptr
drivers/staging/android/binder.c:1605:64:    got void *binder
drivers/staging/android/binder.c:1605:76: warning: incorrect type in
argument 3 (different address spaces)
drivers/staging/android/binder.c:1605:76:    expected void [noderef]
<asn:1>*cookie
drivers/staging/android/binder.c:1605:76:    got void *cookie
 

On Mon, 2012-04-23 at 14:35 -0300, Marcos Souza wrote:
> Resend in plain text, sorry...
> 
> > Em 23 de abril de 2012 14:23, Emil Goode <emilgoode@gmail.com> escreveu:
> >
> >> This patch silences some sparse warnings and adds some line breaks
> >> to take the 80 char limit coding style rule in consideration.
> >>
> >> Signed-off-by: Emil Goode <emilgoode@gmail.com>
> >
> >
> > Nice work Emil!
> >
> > What do you think to put the sparse warnings in the commit message?
> >
> > I think it is better to understand  what are you trying to fix.
> >
> >>
> >> ---
> >>  drivers/staging/android/binder.c |   14 ++++++++++----
> >>  1 file changed, 10 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/staging/android/binder.c
> >> b/drivers/staging/android/binder.c
> >> index c283212..5d31417 100644
> >> --- a/drivers/staging/android/binder.c
> >> +++ b/drivers/staging/android/binder.c
> >> @@ -1600,15 +1600,21 @@ static void binder_transaction(struct binder_proc
> >> *proc,
> >>                case BINDER_TYPE_BINDER:
> >>                case BINDER_TYPE_WEAK_BINDER: {
> >>                        struct binder_ref *ref;
> >> -                       struct binder_node *node = binder_get_node(proc,
> >> fp->binder);
> >> +                       struct binder_node *node = binder_get_node(proc,
> >> +                                                    (void __user
> >> *)fp->binder);
> >>                        if (node = NULL) {
> >> -                               node = binder_new_node(proc, fp->binder,
> >> fp->cookie);
> >> +                               node = binder_new_node(proc,
> >> +                                               (void __user
> >> *)fp->binder,
> >> +                                               (void __user
> >> *)fp->cookie);
> >>                                if (node = NULL) {
> >>                                        return_error = BR_FAILED_REPLY;
> >>                                        goto err_binder_new_node_failed;
> >>                                }
> >> -                               node->min_priority = fp->flags &
> >> FLAT_BINDER_FLAG_PRIORITY_MASK;
> >> -                               node->accept_fds = !!(fp->flags &
> >> FLAT_BINDER_FLAG_ACCEPTS_FDS);
> >> +                               node->min_priority = fp->flags &
> >> +
> >> FLAT_BINDER_FLAG_PRIORITY_MASK;
> >> +
> >> +                               node->accept_fds = !!(fp->flags &
> >> +
> >> FLAT_BINDER_FLAG_ACCEPTS_FDS);
> >>                        }
> >>                        if (fp->cookie != node->cookie) {
> >>                                binder_user_error("binder: %d:%d sending
> >> u%p "
> >> --
> >> 1.7.9.5
> >>
> >> --
> >> To unsubscribe from this list: send the line "unsubscribe
> >> kernel-janitors" in
> >> the body of a message to majordomo@vger.kernel.org
> >> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
> >
> >
> >
> > --
> > Att,
> >
> > Marcos Paulo de Souza
> > Acadêmico de Ciencia da Computação - FURB - SC
> > "Uma vida sem desafios é uma vida sem razão"
> > "A life without challenges, is a non reason life"
> 
> 
> 
> 
> --
> Att,
> 
> Marcos Paulo de Souza
> Acadêmico de Ciencia da Computação - FURB - SC
> "Uma vida sem desafios é uma vida sem razão"
> "A life without challenges, is a non reason life"


