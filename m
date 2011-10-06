From: Borislav Petkov <bp@amd64.org>
Date: Thu, 06 Oct 2011 12:51:08 +0000
Subject: Re: [patch] edac_amd64: cleanup return type of
Message-Id: <20111006125108.GB22432@aftab>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Oct 06, 2011 at 02:30:25AM -0400, Dan Carpenter wrote:
> Sparse complains that edac_cap was declared as dev_type and we are
> returning edac_type.  Historically, edac_type was correct but since
> then we have changed it to return a bit field.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied and pushed out,

thanks.

-- 
Regards/Gruss,
Boris.

Advanced Micro Devices GmbH
Einsteinring 24, 85609 Dornach
GM: Alberto Bozzo
Reg: Dornach, Landkreis Muenchen
HRB Nr. 43632 WEEE Registernr: 129 19551
