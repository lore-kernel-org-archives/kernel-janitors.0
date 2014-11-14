From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 14 Nov 2014 08:54:10 +0000
Subject: re: exit: reparent: cleanup the changing of ->parent
Message-Id: <20141114085410.GA9293@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Oleg Nesterov,

The patch eb6d8479b73d: "exit: reparent: cleanup the changing of
->parent" from Nov 13, 2014, leads to the following static checker
warning:

	kernel/exit.c:543 forget_original_parent()
	warn: add some parenthesis here?

kernel/exit.c
   538          /* Can drop and reacquire tasklist_lock */
   539          reaper = find_new_reaper(father);
   540          list_for_each_entry(p, &father->children, sibling) {
   541                  for_each_thread(p, t) {
   542                          t->real_parent = reaper;
   543                          BUG_ON(!t->ptrace != (t->parent = father));
                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The reason for this warning is that many people forget that ! is higher
precedence than =.  This is a complicated condition however you write
it, but it might be more clear to say:

				BUG_ON((!!t->ptrace) = (t->parent = father));

I'm not sure.

   544                          if (likely(!t->ptrace))
   545                                  t->parent = t->real_parent;
   546                          if (t->pdeath_signal)
   547                                  group_send_sig_info(t->pdeath_signal,
   548                                                      SEND_SIG_NOINFO, t);
   549                  }
   550                  /*
   551                   * If this is a threaded reparent there is no need to
   552                   * notify anyone anything has happened.
   553                   */
   554                  if (!same_thread_group(reaper, father))
   555                          reparent_leader(father, p, &dead_children);
   556          }


regards,
dan carpenter
