From: Larry Finger <Larry.Finger@lwfinger.net>
Date: Mon, 11 Nov 2013 02:22:50 +0000
Subject: Re: [PATCH] various space fixes
Message-Id: <52803F7A.8030403@lwfinger.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CA+1HSerVbdKzAoGFZ6YCTi+BrH+jC3JUo3yg6em1qJ9E-rq9Wg@mail.gmail.com>
In-Reply-To: <CA+1HSerVbdKzAoGFZ6YCTi+BrH+jC3JUo3yg6em1qJ9E-rq9Wg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 11/10/2013 08:01 PM, Marco Lavagnino wrote:
> Fixes various warnings from empty spaces.
>
> This is the first patch I submit, so I'm not completely sure if I'm
> doing it right. If this is correct I might start submitting more
> subtantial patches. If it is wrong, please tell me what did I do
> wrong, so I can learn.
>
> Signed-off-by: Marco S Lavagnino <marco.lavagnino@gmail.com>

Your patches are based against the wrong directory. They should use the -p1 
option for patch, so that they can be applied when the home directory is the 
root of the kernel tree. For example, the first two lines of each file patch 
should be

--- a/drivers/staging/rtl8188eu/core/rtw_cmd.c
+++ b/drivers/staging/rtl8188eu/core/rtw_cmd.c

In addition, the subject of the patch should include the driver name. In your 
case, it should be

[PATCH] staging: r8188eu: Various space fixes

Larry

