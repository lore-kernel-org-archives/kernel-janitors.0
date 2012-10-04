From: "Arend van Spriel" <arend@broadcom.com>
Date: Thu, 04 Oct 2012 16:24:11 +0000
Subject: Re: [patch 2/3] brcmfmac: fix end of loop check (signedness bug)
Message-Id: <506DB82B.9010106@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121003060631.GB3802@elgon.mountain>
In-Reply-To: <20121003060631.GB3802@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Brett Rudley <brudley@broadcom.com>, Roland Vossen <rvossen@broadcom.com>, "Franky (Zhenhui) Lin" <frankyl@broadcom.com>, Kan Yan <kanyan@broadcom.com>, "John W. Linville" <linville@tuxdriver.com>, Hante Meuleman <meuleman@broadcom.com>, Pieter-Paul Giesberts <pieterpg@broadcom.com>, linux-wireless@vger.kernel.org, brcm80211-dev-list@broadcom.com, kernel-janitors@vger.kernel.org

On 10/03/2012 08:06 AM, Dan Carpenter wrote:
> The problem here is that we loop until "remained_buf_len" is less than
> zero, but since it is unsigned, it never is.
>
> "remained_buf_len" has to be large enough to hold the value from
> "mgmt_ie_buf_len".  That variable is type u32, but it only holds small
> values so I have changed to both variables to int.
>
> Also I removed the bogus initialization from "mgmt_ie_buf_len" so that
> GCC can detect if it is used unitialized.  I moved the declaration of
> "remained_buf_len" closer to where it is used so it's easier to read.
>

Hi Dan,

Good catch. I applied the patch internally on our HEAD and had it 
reviewed. We did not take moving the declaration as we prefer to have 
all variables at the top of the function. It makes it easier to find 
what is declared in a function and whether exceeding the local variable 
limit mentioned in Chapter 6. Functions of the CodingStyle (we are 
exceeding it already ;-) ).

Are you ok with us submitting it? It would be sent out for 3.8 or do you 
prefer to have it fixed in 3.7?

Gr. AvS

