From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Wed, 12 Sep 2012 15:50:54 +0000
Subject: Re: [PATCH v2 7/8] drivers/media/platform/davinci/vpbe.c: Removes useless kfree()
Message-Id: <CA+MoWDquDi6+kY9z3rj79dJK6j5tSWO9oWHCkvt6J-XBB=HNvA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1347454564-5178-2-git-send-email-peter.senna@gmail.com>
	<CAH0vN5+ZoexHtmgyZ+s9tiW3LYx+6PMT8aLyYt-T5mnaGXvYbQ@mail.gmail.com>
In-Reply-To: <CAH0vN5+ZoexHtmgyZ+s9tiW3LYx+6PMT8aLyYt-T5mnaGXvYbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcos Souza <marcos.souza.org@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

Marcos,

> Now that you removed this kfree, you could remove this label too. Very
> nice your cleanup :)
Thanks!

>
>>  vpbe_fail_sd_register:
>>         kfree(vpbe_dev->encoders);
>>  vpbe_fail_v4l2_device:

The problem removing the label is that it will require some more work
naming the labels. See:
if (!vpbe_dev->amp) {
...
	goto vpbe_fail_amp_register;

If I just remove the label vpbe_fail_amp_register, the label names
will not make sense any more as the next label is
vpbe_fail_sd_register. So I will need to change the name to something
different or rename all labels to out1, out2, out3 or err1, err2,
err3, or ....

Any suggestions?

-- 
Peter
