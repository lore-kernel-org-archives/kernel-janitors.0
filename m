From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 04 Apr 2019 09:36:22 +0000
Subject: Re: [PATCH] remoteproc: silence an uninitialized variable warning
Message-Id: <20190404093622.GM32613@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190404084204.GA20193@kadam>
 <a08db945-44d3-ff99-7a89-75367f314855@codeaurora.org>
In-Reply-To: <a08db945-44d3-ff99-7a89-75367f314855@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mukesh Ojha <mojha@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Apr 04, 2019 at 02:47:39PM +0530, Mukesh Ojha wrote:
> 
> On 4/4/2019 2:12 PM, Dan Carpenter wrote:
> > Smatch complains that "ret" might be uninitialized.  I can see why it
> > generates the warning, but I don't know if it's actually possible.
> > Anyway initializing "ret" here is harmless.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >   drivers/soc/qcom/mdt_loader.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> > index 1c488024c698..fc58d660692f 100644
> > --- a/drivers/soc/qcom/mdt_loader.c
> > +++ b/drivers/soc/qcom/mdt_loader.c
> > @@ -188,7 +188,7 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
> >   	if (reloc_base)
> >   		*reloc_base = mem_reloc;
> > -
> > +	ret = 0;
> 
> 
> You are overriding the value here, better keep it at the start.

I like how I wrote it.  It makes it clear that this is the success path.

regards,
dan carpenter
