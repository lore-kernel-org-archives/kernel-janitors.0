From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 04 Sep 2012 09:14:25 +0000
Subject: Re: [PATCH 1/1] mm: Fix unused function warnings in vmstat.c
Message-Id: <20120904091425.GA19396@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAHve1mzC+x=z5L4-74EYhAmi7Jqc-XqD7u5yRctbHwgKVyO2dA@mail.gmail.com>
In-Reply-To: <CAHve1mzC+x=z5L4-74EYhAmi7Jqc-XqD7u5yRctbHwgKVyO2dA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Sep 04, 2012 at 10:43:27AM +0200, Luis G.F wrote:
> frag_start(), frag_next(), frag_stop(), walk_zones_in_node() throws
> compilation warnings (-Wunused-function) even when are currently used.
> 
> This patchs fix the compilation warnings in vmstat.c
> 
> Signed-off-by: Luis Gonzalez Fernandez <luisgf@gmail.com>

Don't send kernel janitor patches for stuff under mm/ or kernel/
etc.  Best to start where there are fewer people involved.  There
are a some problems with this patch, but don't fix and resend the
comments are just for educational purposes only.

The subject says "Fix" but really it's not a bug fix, it's just
silencing a warning.  It doesn't change user visible behavior.

This should use the __unused define as in:
-static void *frag_start(struct seq_file *m, loff_t *pos)
+static void __unused *frag_start(struct seq_file *m, loff_t *pos)

The patch is corrupted.  Read Documentation/email-clients.txt.
Send the patch to yourself and try apply it.  Save the whole email
including headers and everything.  `cat raw_email.txt | patch -p1`.

regards,
dan carpenter


