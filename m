From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 19 Nov 2015 05:22:56 +0000
Subject: Re: x86, mpx: Decode MPX instruction to get bound violation information
Message-Id: <20151119052256.GW7289@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hey Dave,

Whatever happened with this?

regards,
dan carpenter

On Mon, May 18, 2015 at 03:32:16PM +0300, Dan Carpenter wrote:
> Hello Dave Hansen,
> 
> The patch fcc7ffd67991: "x86, mpx: Decode MPX instruction to get
> bound violation information" from Nov 14, 2014, leads to the
> following static checker warning:
> 
> 	arch/x86/mm/mpx.c:147 get_reg_offset()
> 	warn: masked condition is always false. '((insn->rex_prefix.value) & 2) = 1'
> 
> arch/x86/mm/mpx.c
>    138          switch (type) {
>    139          case REG_TYPE_RM:
>    140                  regno = X86_MODRM_RM(insn->modrm.value);
>    141                  if (X86_REX_B(insn->rex_prefix.value) = 1)
>    142                          regno += 8;
>    143                  break;
>    144  
>    145          case REG_TYPE_INDEX:
>    146                  regno = X86_SIB_INDEX(insn->sib.value);
>    147                  if (X86_REX_X(insn->rex_prefix.value) = 1)
>                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Was X86_REX_B() intended?
> 
>    148                          regno += 8;
>    149                  break;
>    150  
>    151          case REG_TYPE_BASE:
>    152                  regno = X86_SIB_BASE(insn->sib.value);
>    153                  if (X86_REX_B(insn->rex_prefix.value) = 1)
>    154                          regno += 8;
>    155                  break;
>    156  
>    157          default:
>    158                  pr_err("invalid register type");
>    159                  BUG();
>    160                  break;
>    161          }
> 
> regards,
> dan carpenter
