From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 05 Apr 2019 07:33:01 +0000
Subject: Re: [PATCH] remoteproc: silence an uninitialized variable warning
Message-Id: <20190405073301.GS32613@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190404084204.GA20193@kadam>
 <a08db945-44d3-ff99-7a89-75367f314855@codeaurora.org>
 <20190404093622.GM32613@kadam>
 <f570c0c0-1493-88d7-474c-ad7437e6a1d0@codeaurora.org>
In-Reply-To: <f570c0c0-1493-88d7-474c-ad7437e6a1d0@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mukesh Ojha <mojha@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Apr 05, 2019 at 12:38:19PM +0530, Mukesh Ojha wrote:
> 
> On 4/4/2019 3:06 PM, Dan Carpenter wrote:
> > On Thu, Apr 04, 2019 at 02:47:39PM +0530, Mukesh Ojha wrote:
> > > On 4/4/2019 2:12 PM, Dan Carpenter wrote:
> > > > Smatch complains that "ret" might be uninitialized.  I can see why it
> > > > generates the warning, but I don't know if it's actually possible.
> > > > Anyway initializing "ret" here is harmless.
> > > > 
> > > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > > ---
> > > >    drivers/soc/qcom/mdt_loader.c | 2 +-
> > > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> > > > index 1c488024c698..fc58d660692f 100644
> > > > --- a/drivers/soc/qcom/mdt_loader.c
> > > > +++ b/drivers/soc/qcom/mdt_loader.c
> > > > @@ -188,7 +188,7 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
> > > >    	if (reloc_base)
> > > >    		*reloc_base = mem_reloc;
> > > > -
> > > > +	ret = 0;
> > > 
> > > You are overriding the value here, better keep it at the start.
> > I like how I wrote it.  It makes it clear that this is the success path.
> 
> 
> But think about a case when this request_firmware_into_buf fails or the
> snippet above that can set the ret with error value
> 
> right.. is not that possible?..and ret = 0 stops propagating the error
> properly.
> 

Gar.  I read "goto out;" instead of "break;".  It probably should be
goto out though...  Anyway, I will resend.

Thanks!

regards,
dan carpenter
