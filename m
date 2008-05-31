From: "Manish Katiyar" <mkatiyar@gmail.com>
Date: Sat, 31 May 2008 19:22:32 +0000
Subject: Re: [PATCH] ext3 : Remove redundant condition in ext3_free_blocks_sb()
Message-Id: <ea11fea30805311210o15de2373m71d91228356f9bfd@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea11fea30805311156q7488714ftf8b0b8b8cea85b76@mail.gmail.com>
	 <20080531190527.GG28946@ZenIV.linux.org.uk>
In-Reply-To: <20080531190527.GG28946@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Jun 1, 2008 at 12:35 AM, Al Viro <viro@zeniv.linux.org.uk> wrote:
> On Sun, Jun 01, 2008 at 12:26:41AM +0530, Manish Katiyar wrote:
>> For two unsigned values the check "block+count < block"  is always
>> false. Thus the below patch removes that condition.
>
> Really?  Always?
>
>        unsigned block = 1;
>        unsigned count = ~0U;
>
> What will be the value and type of block + count?  What will be the
> value of block + count < block?

Oooops....my bad, but I doubt if we pass such values in ext* code anywhere.

>



-- 
Thanks & Regards,
********************************************
Manish Katiyar ( http://mkatiyar.googlepages.com )
3rd Floor, Fair Winds Block
EGL Software Park
Off Intermediate Ring Road
Bangalore 560071, India
***********************************************
