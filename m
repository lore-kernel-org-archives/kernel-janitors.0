From: Jakub Kicinski <kuba@kernel.org>
Date: Sat, 31 Oct 2020 19:32:28 +0000
Subject: Re: [PATCH] net: atm: fix update of position index in lec_seq_next
Message-Id: <20201031123228.5040bd7b@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201027114925.21843-1-colin.king@canonical.com>
In-Reply-To: <20201027114925.21843-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 27 Oct 2020 11:49:25 +0000 Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The position index in leq_seq_next is not updated when the next
> entry is fetched an no more entries are available. This causes
> seq_file to report the following error:
> 
> "seq_file: buggy .next function lec_seq_next [lec] did not update
>  position index"
> 
> Fix this by always updating the position index.
> 
> [ Note: this is an ancient 2002 bug, the sha is from the
>   tglx/history repo ]
> 
> Fixes 4aea2cbff417 ("[ATM]: Move lan seq_file ops to lec.c [1/3]")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, very sneaky there with the lack of a colon on the Fixes tag :)


BTW looking at seq_read() it seems to eat the potential error code from
->next, doesn't it?

@@ -254,9 +254,11 @@ ssize_t seq_read(struct file *file, char __user *buf, size_t size, loff_t *ppos)
        }
        m->op->stop(m, p);
        n = min(m->count, size);
-       err = copy_to_user(buf, m->buf, n);
-       if (err)
-               goto Efault;
+       if (n) {
+               err = copy_to_user(buf, m->buf, n);
+               if (err)
+                       goto Efault;
+       }
        copied += n;
        m->count -= n;
        m->from = n;

Maybe? Or at least:

@@ -239,10 +239,8 @@ ssize_t seq_read(struct file *file, char __user *buf, size_t size, loff_t *ppos)
                                            m->op->next);
                        m->index++;
                }
-               if (!p || IS_ERR(p)) {
-                       err = PTR_ERR(p);
+               if (!p || IS_ERR(p))
                        break;
-               }
                if (m->count >= size)
                        break;
                err = m->op->show(m, p);
