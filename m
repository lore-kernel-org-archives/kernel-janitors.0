From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 19 Jun 2015 08:52:03 +0000
Subject: Re: [patch] pinctrl: samsung: don't truncate the last char of "-grp"
Message-Id: <20150619085203.GO28762@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150611154631.GA13202@mwanda>
 <CAJKOXPe8Pv5t9tLdFZAV+9CSiM302GTVt6_j3vKHkeFOK8U=Lw@mail.gmail.com>
In-Reply-To: <CAJKOXPe8Pv5t9tLdFZAV+9CSiM302GTVt6_j3vKHkeFOK8U=Lw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Thomas Abraham <thomas.abraham@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Jun 15, 2015 at 01:17:36PM +0900, Krzysztof Kozlowski wrote:
> I would prefer splitting this into two patches: one for fixing
> truncated name (by usage of kasprintf) and second for ENOMEM message.
> The second patch can get rid of ENOMEM message in other places as
> well.
> 
> As for the first issue I think that function suffix would also be
> truncated in the same way.

Sorry for the delayed response, I've been offline for a few days.

Yeah, you're right.

Let me resend.

regards,
dan carpenter

