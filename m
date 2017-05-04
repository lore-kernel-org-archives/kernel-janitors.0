From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 04 May 2017 16:09:00 +0000
Subject: Re: [PATCH] of/unittest: Missing unlocks on error
Message-Id: <CAL_JsqKfXL6A=QbCrF=6tyn6HwZa5MafNvZtS-HbBBxkBqO7bw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170503194950.4xbdbwybvx6dkadx@mwanda>
In-Reply-To: <20170503194950.4xbdbwybvx6dkadx@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Frank Rowand <frank.rowand@sony.com>, Frank Rowand <frowand.list@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, May 3, 2017 at 2:49 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> Static checkers complain that we should unlock before returning.  Which
> is true.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.

Rob
