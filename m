From: Kees Cook <keescook@chromium.org>
Date: Wed, 31 Jul 2019 19:58:06 +0000
Subject: Re: [PATCH 1/2] randstruct: fix a bug in is_pure_ops_struct()
Message-Id: <201907311257.8436E997A4@keescook>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1564595346.git.kjw1627@gmail.com>
 <2ba5ebfa2c622ece4952b5068b4154213794e5c4.1564595346.git.kjw1627@gmail.com>
In-Reply-To: <2ba5ebfa2c622ece4952b5068b4154213794e5c4.1564595346.git.kjw1627@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joonwon Kang <kjw1627@gmail.com>
Cc: re.emese@gmail.com, kernel-hardening@lists.openwall.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, jinb.park7@gmail.com

On Thu, Aug 01, 2019 at 03:01:10AM +0900, Joonwon Kang wrote:
> Before this, there were false negatives in the case where a struct
> contains other structs which contain only function pointers because
> of unreachable code in is_pure_ops_struct().
> 
> Signed-off-by: Joonwon Kang <kjw1627@gmail.com>

I've applied this (with some commit log tweaks) and it should be visible
in linux-next soon. I'll send this on to Linus before -rc3.

-- 
Kees Cook
