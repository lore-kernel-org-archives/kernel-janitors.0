From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 20 Mar 2017 11:14:51 +0000
Subject: Re: [PATCH 3/4] staging: atomisp: remove useless condition in if-statements
Message-Id: <20170320111451.GC4343@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170320110006.GA17811@SEL-JYOUN-D1>
In-Reply-To: <20170320110006.GA17811@SEL-JYOUN-D1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daeseok Youn <daeseok.youn@gmail.com>
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org, alan@linux.intel.com, singhalsimran0@gmail.com, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Mar 20, 2017 at 08:00:06PM +0900, Daeseok Youn wrote:
> The css_pipe_id was checked with 'CSS_PIPE_ID_COPY' in previous if-
> statement. In this case, if the css_pipe_id equals to 'CSS_PIPE_ID_COPY',
> it could not enter the next if-statement. But the "next" if-statement
> has the condition to check whether the css_pipe_id equals to
> 'CSS_PIPE_ID_COPY' or not. It should be removed.
> 
> Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>

The patch is correct but the changelog is not.

s/CSS_PIPE_ID_COPY/CSS_PIPE_ID_YUVPP/

regards,
dan carpenter

