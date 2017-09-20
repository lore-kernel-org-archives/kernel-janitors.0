From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 20 Sep 2017 09:12:50 +0000
Subject: Re: [PATCH 4/6] [media] go7007: Use common error handling code in s2250_probe()
Message-Id: <20170920091250.rmrdilesv754sddi@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b36ece3f-0f31-9bb6-14ae-c4abf7cd23ee@users.sourceforge.net>
 <c4d2e584-39ca-6e30-43ee-56088905149e@users.sourceforge.net>
 <20170919084216.ctvwpmswr3ckhwzc@mwanda>
 <a2259b43-381e-b59f-5e5d-082ae4e80d5e@users.sourceforge.net>
In-Reply-To: <a2259b43-381e-b59f-5e5d-082ae4e80d5e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Sep 20, 2017 at 09:09:16AM +0200, SF Markus Elfring wrote:
> >> @@ -555,17 +553,13 @@ static int s2250_probe(struct i2c_client *client,
> >>  	/* initialize the audio */
> >>  	if (write_regs(audio, aud_regs) < 0) {
> >>  		dev_err(&client->dev, "error initializing audio\n");
> >> -		goto fail;
> >> +		goto e_io;
> > 
> > Preserve the error code.
> 
> Do you suggest then to adjust the implementation of the function "write_regs"
> so that a more meaningful value would be used instead of the failure indication "-1"?
> 

If you want to, yeah, that would be good.

regards,
dan carpenter

