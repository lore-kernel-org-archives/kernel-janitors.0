From: "H. Peter Anvin" <hpa@zytor.com>
Date: Sun, 29 Mar 2009 21:28:00 +0000
Subject: Re: [PATCH 1/2] x86: Add getter/setter static inlines for x86 descriptors
Message-Id: <49CFE7E0.80500@zytor.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1238361501.git.ice799@gmail.com> <76c37743d20e5737eadc747cbdddbc2beb11f074.1238361501.git.ice799@gmail.com>
In-Reply-To: <76c37743d20e5737eadc747cbdddbc2beb11f074.1238361501.git.ice799@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Damato <ice799@gmail.com>
Cc: linux-x86_64@vger.kernel.org, w@1wt.eu, mingo@elte.hu, jeremy@goop.org, linux-newbie@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Joe Damato wrote:
> Static inline getters/setters have been provided to encourage consumers not to touch the internals of 32bit x86 descriptors directly.
> 
> Signed-off-by: Joe Damato <ice799@gmail.com>

Okay, what is the motivation for this?

This is a serious question.  The x86 descriptors are so complex that
it's not clear to me that this restriction makes the code any more
clear.  Especially not with things like:

-		cpu->arch.gdt[i].b |= 0x00000100;
+		desc_set_hi(tmp,  desc_get_hi(tmp) | 0x00000100);

This isn't an improvement.  If you're doing to so something like this,
you need to actually implement the *intent* here.

	-hpa

-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.

