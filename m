From: Jack Stone <jwjstone@fastmail.fm>
Date: Wed, 08 Apr 2009 11:38:53 +0000
Subject: Re: [PATCH 05/56] block: Remove void casts
Message-Id: <49DC8CCD.8030901@fastmail.fm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1239189748-11703-1-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-2-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-3-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-4-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-5-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-6-git-send-email-jwjstone@fastmail.fm> <36ca99e90904080431o3fae1c2es555327578ab06d7@mail.gmail.com>
In-Reply-To: <36ca99e90904080431o3fae1c2es555327578ab06d7@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bert Wesarg <bert.wesarg@googlemail.com>
Cc: linux-kernel@vger.kernel.org, jeff@garzik.org, kernel-janitors@vger.kernel.org

Bert Wesarg wrote:
> Could you feed the patches through checkpatch.pl to find and fix these
> style issues.
>
> (...)
>   
> If typeof(c) = CommandList_struct*, that you could replace
> sizeof(CommandList_struct) with sizeof(*c) to make the expression
> shorter and fit into one line.
>   
I was trying to avoid any changes beyond removing the void casts.

I can go through and fix all these if people don't think thats too much to
review in one go.

I'll fix the line issues you've flagged up and resend the affected patched.

Thanks,

Jack
