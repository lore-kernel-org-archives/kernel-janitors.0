From: Roland Dreier <rdreier@cisco.com>
Date: Mon, 16 Apr 2007 17:46:26 +0000
Subject: Re: [KJ] [PATCH]Rocket port:use mutex instead of binary  semaphore
Message-Id: <adabqho8b65.fsf@cisco.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070416174155.GA9314@arun.site>
In-Reply-To: <20070416174155.GA9314@arun.site> (Milind Arun Choudhary's message of "Mon, 16 Apr 2007 23:11:55 +0530")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Milind Arun Choudhary <milindchoudhary@gmail.com>
Cc: Kernel Janitors <kernel-janitors@lists.osdl.org>, LKML <linux-kernel@vger.kernel.org>, Andrw Morton <akpm@linux-foundation.org>

 > -	down_interruptible(&info->write_sem);
 > +	if(mutex_lock_interruptible(&info->write_lock)){
 > +		return -ERESTARTSYS;
 > +	}

1) This is a semantic change.  Of course using down_interruptible()
without checking the return value is almost certainly a bug, but have
you thought about whether returning ERESTARTSYS is correct here?  If
you have, then please include the reasoning in your patch description.
(Another possibility would be to just use an uninterruptible mutex_lock())

2) The coding style for the if statement is not quite right.  The
correct way is to do

	if (condition)
		one_liner;

(note the space between the 'if' and the '(', and no braces used)

 - R.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
