From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 18 Jan 2013 21:35:14 +0000
Subject: Re: [patch] target: change sprintf to snprintf
Message-Id: <20130118213514.GO16282@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130118130512.GA1634@elgon.mountain>
 <1358537812.18551.446.camel@haakon2.linux-iscsi.org>
In-Reply-To: <1358537812.18551.446.camel@haakon2.linux-iscsi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jan 18, 2013 at 11:36:52AM -0800, Nicholas A. Bellinger wrote:
> On Fri, 2013-01-18 at 16:05 +0300, Dan Carpenter wrote:
> > "buf" is 128 characters and "vpd->device_identifier" is 256.  It makes
> > the static checkers complain.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> 
> Applied to target-pending/for-next.
> 
> > Probably we should just raise VPD_TMP_BUF_SIZE to 300.
> 
> Also bumping up VPD_TMP_BUF_SIZE to 254 to match the usage with
> INQUIRY_VPD_DEVICE_IDENTIFIER_LEN sized vpd->device_identifier[] below.
> 

It could still go over 254 because it's "T10 VPD Binary Device
Identifier: " plus INQUIRY_VPD_DEVICE_IDENTIFIER_LEN.  But I agree
that probably 254 is enough space.

regards,
dan carpenter

