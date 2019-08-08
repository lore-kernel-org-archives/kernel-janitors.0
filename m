From: Mimi Zohar <zohar@kernel.org>
Date: Thu, 08 Aug 2019 11:17:22 +0000
Subject: Re: [PATCH] ima: Fix a use after free in ima_read_modsig()
Message-Id: <1565263042.4220.25.camel@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190808103310.GC30506@mwanda>
In-Reply-To: <20190808103310.GC30506@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Thiago Jung Bauermann <bauerman@linux.ibm.com>
Cc: Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 2019-08-08 at 13:33 +0300, Dan Carpenter wrote:
> This code frees "hdr" and then dereferences it on the next line to get
> the error code.
> 
> Fixes: 39b07096364a ("ima: Implement support for module-style appended signatures")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, Dan.  Julia already reported this.  Thiago posted a patch last
night.  Just getting to it now.  Can I add your Reviewed-by or Tested-
by?

Mimi
