From: Nikola Pajkovsky <n.pajkovsky@gmail.com>
Date: Thu, 03 May 2012 08:40:26 +0000
Subject: Re: [PATCH] Staging: Comedi adv_pci1710: Cleaned up function check_channel_list
Message-Id: <88obq5zmh1.fsf@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1335975217-5895-1-git-send-email-tomas.melin@iki.fi>
In-Reply-To: <1335975217-5895-1-git-send-email-tomas.melin@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> On Wed, May 02, 2012 at 07:13:37PM +0300, Tomas Melin wrote:
>> -Simplified function logic by assuming that n_chan >1 if not <=1. Removes
>> one level of indentation.
>> -> readability improved and code fits into 80 chars
>> - Code indentation fixes, corrected comments
>> - Added braces to if() for readability
>> 
>
> Greg of course is the Boss-man and he already explained that this
> needed to get broken up, but yeah I also wanted to say that as well.
> The first patch should just pull the if (n_chan = 1) forward,
> remove the else clause, and pull the indent level in.
>
> When I review this stuff I have a script called rename_rev.pl
> (attached) and I `cat your_patch.txt | rename_rev.pl`.  It removes
> the indenting changes and only shows the logic changes.  So the
> solid block of changes becomes a two liner which takes 10 seconds
> to review.  The other changes to line breaks and comments and curly
> parens are much simpler to review on their own.  10 seconds for
> each.  It's way way easier to review one liner changes than a
> tangled block of changes.

And I have to thank you for the script. thanks.

-- 
Nikola
