From: Alan Cox <alan@linux.intel.com>
Date: Thu, 30 Mar 2017 10:52:44 +0000
Subject: Re: [PATCH 1/2] staging: atomisp: simplify the if condition in atomisp_freq_scaling()
Message-Id: <1490871164.4738.0.camel@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170330062449.GA25214@SEL-JYOUN-D1>
In-Reply-To: <20170330062449.GA25214@SEL-JYOUN-D1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daeseok Youn <daeseok.youn@gmail.com>, mchehab@kernel.org
Cc: gregkh@linuxfoundation.org, dan.carpenter@oracle.com, singhalsimran0@gmail.com, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 2017-03-30 at 15:24 +0900, Daeseok Youn wrote:
> The condition line in if-statement is needed to be shorthen to
> improve readability.
> 
> Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
> ---

How about a define for ATOMISP_IS_CHT(isp) instead - as we will need
these tests in other places where there are ISP2400/ISP2401 ifdefs ?

Alan

