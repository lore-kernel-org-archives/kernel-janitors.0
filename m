From: Dan Carpenter <error27@gmail.com>
Date: Sat, 06 Nov 2010 04:05:51 +0000
Subject: Re: Cc: [PATCH] Staging: solo6x10: Fix checkpatch errors and most
Message-Id: <20101106040551.GD31317@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <AANLkTikQ_a4bS6aNOfEJMgF3w_17S8RBrWx7HbpqhK0K@mail.gmail.com>
In-Reply-To: <AANLkTikQ_a4bS6aNOfEJMgF3w_17S8RBrWx7HbpqhK0K@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Nov 05, 2010 at 08:08:35PM -0300, Facundo Gaich wrote:
> (Forgot to Cc this list in the original email. By the way, I sent this
> to greg@kroah instead of greg@suse, because that's what the TODO file
> said. I hope that's still ok?)
> 
> This patch fixes all errors and most warnings reported by
> checkpatch.pl for all the files in the driver.

Hi Facundo,

Your email client is mangling this patch.  It's wrapping the lines and
changing the spaces to tabs.

Please read Documentation/email-clients.txt.  Then send an email to
yourself and verify that the patch applies.  (Save it as a raw email.
cat raw_email.txt | patch -p1 -R).  Then resend and we can review it.

I didn't see the original email, but don't forget to CC Ben Collins as
well.  His email is <bcollins@bluecherry.net>.  And CC the staging list
too <devel@driverdev.osuosl.org>.

regards,
dan carpenter

