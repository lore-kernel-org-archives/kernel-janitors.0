From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Date: Mon, 30 Apr 2018 15:26:25 +0000
Subject: Re: [PATCH][next] media: ispstat: don't dereference user_cfg before a null check
Message-Id: <9c1e7c1e-c391-4b91-7836-61a8b9d5489a@embeddedor.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180424130618.18211-1-colin.king@canonical.com>
 <20180426083731.72bmygsp2waf3eeu@valkosipuli.retiisi.org.uk>
 <2302951.d1m0yxIoYN@avalon>
 <20180430151503.d3kq2zomil6uh2xf@valkosipuli.retiisi.org.uk>
In-Reply-To: <20180430151503.d3kq2zomil6uh2xf@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sakari Ailus <sakari.ailus@iki.fi>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Colin King <colin.king@canonical.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Sakari,

On 04/30/2018 10:15 AM, Sakari Ailus wrote:
>> Isn't there a guarantee that new_buf won't be NULL ? The new_buf pointer comes
>> from the parg variable in video_usercopy(), which should always point to a
>> valid buffer given that the ioctl number specifies a non-zero size.
> 
> Fair question. After looking at the code, I agree with you; there should be
> no reason to perform the check in the first place. It may have been that
> the function has been used differently in the past but the check should be
> rather removed now.
> 
> I'll drop the patch.
> 

Please, if the check isn't needed anymore, make sure it is removed.

This helps to reduce the number of false positives reported by static 
analyzers.

Thanks
--
Gustavo
