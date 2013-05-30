From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 30 May 2013 12:13:05 +0000
Subject: Re: [Patch] Staging: winbond: Made local functions static
Message-Id: <20130530121305.GH23932@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <51A6E81C.2000303@gmail.com>
In-Reply-To: <51A6E81C.2000303@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, May 30, 2013 at 11:18:12AM +0530, Harsh Kumar wrote:
> Few functions are used only in one file. They are not included in any 
> other .h or .c files (I used grep to check). They seem to be local functions.
> So, I have made them static.
> I have also inlined one function as it is a one line function.
> 
> Signed-off-by: Harsh Kumar <harsh1kumar@gmail.com>
> 
> ---
>  drivers/staging/winbond/reg.c |   25 ++++++++++++++-----------
>  1 file changed, 14 insertions(+), 11 deletions(-)
> 
> diff -uprN a/drivers/staging/winbond/reg.c b/drivers/staging/winbond/reg.c
> --- a/drivers/staging/winbond/reg.c	2013-05-28 00:52:20.000000000 +0530
> +++ b/drivers/staging/winbond/reg.c	2013-05-30 10:28:48.038634461 +0530
> @@ -920,20 +920,20 @@ void Uxx_power_on_procedure(struct hw_da
>  	Wb35Reg_WriteSync(pHwData, 0x03f8, 0x7ff);
>  }
>  
> -void Set_ChanIndep_RfData_al7230_24(struct hw_data *pHwData, u32 *pltmp , char number)
> +static void Set_ChanIndep_RfData_al7230_24(struct hw_data *pHwData, u32 *pltmp, 
> +					char number)
>  {
>  	u8	i;
> -

Please leave the blank line here between the declarations and the
code.  This is firmly established kernel standard, but it's probably
complicated to add it to checkpatch.pl...

Btw, this code uses u8 and char where int would be more appropriate.

regards,
dan carpenter

