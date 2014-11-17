From: Oleg Nesterov <oleg@redhat.com>
Date: Mon, 17 Nov 2014 18:42:28 +0000
Subject: Re: exit: reparent: cleanup the changing of ->parent
Message-Id: <20141117184228.GA26247@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141114085410.GA9293@mwanda>
In-Reply-To: <20141114085410.GA9293@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 11/14, Dan Carpenter wrote:
>
> The patch eb6d8479b73d: "exit: reparent: cleanup the changing of
> ->parent" from Nov 13, 2014, leads to the following static checker
> warning:
>
> 	kernel/exit.c:543 forget_original_parent()
> 	warn: add some parenthesis here?
>
> kernel/exit.c
>    538          /* Can drop and reacquire tasklist_lock */
>    539          reaper = find_new_reaper(father);
>    540          list_for_each_entry(p, &father->children, sibling) {
>    541                  for_each_thread(p, t) {
>    542                          t->real_parent = reaper;
>    543                          BUG_ON(!t->ptrace != (t->parent = father));
>                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> The reason for this warning is that many people forget that ! is higher
> precedence than =.

Do you really think we should try to shut up this warning?

IMO this warning is wrong, "!A = B" or "!A != B" looks fine to me...


> This is a complicated condition however you write
> it, but it might be more clear to say:
>
> 				BUG_ON((!!t->ptrace) = (t->parent = father));

This is subjective, but to me it looks more confusing.

If we really want to "fix" it, I'd suggest

				BUG_ON((!t->ptrace) != (t->parent = father));

Oleg.

