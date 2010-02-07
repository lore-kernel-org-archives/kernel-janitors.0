From: Avi Kivity <avi@redhat.com>
Date: Sun, 07 Feb 2010 11:47:25 +0000
Subject: Re: [PATCH 4/11] arch/x86/kvm: Correct NULL test
Message-Id: <4B6EA84D.20500@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1002060942390.8092@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1002060942390.8092@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Marcelo Tosatti <mtosatti@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 02/06/2010 10:43 AM, Julia Lawall wrote:
> From: Julia Lawall<julia@diku.dk>
>
> msr was tested above, so the second test is not needed.
>
>    

Applied, thanks.

-- 
error compiling committee.c: too many arguments to function

