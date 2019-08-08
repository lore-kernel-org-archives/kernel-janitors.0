From: Mimi Zohar <zohar@kernel.org>
Date: Thu, 08 Aug 2019 11:55:38 +0000
Subject: Re: [PATCH] ima: Fix a use after free in ima_read_modsig()
Message-Id: <1565265338.4077.1.camel@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190808103310.GC30506@mwanda>
         <1565263042.4220.25.camel@kernel.org> <20190808114549.GJ1935@kadam>
In-Reply-To: <20190808114549.GJ1935@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Thiago Jung Bauermann <bauerman@linux.ibm.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 2019-08-08 at 14:45 +0300, Dan Carpenter wrote:
> On Thu, Aug 08, 2019 at 07:17:22AM -0400, Mimi Zohar wrote:
> > On Thu, 2019-08-08 at 13:33 +0300, Dan Carpenter wrote:
> > > This code frees "hdr" and then dereferences it on the next line to get
> > > the error code.
> > > 
> > > Fixes: 39b07096364a ("ima: Implement support for module-style appended signatures")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > Thanks, Dan.  Julia already reported this.  Thiago posted a patch last
> > night.  Just getting to it now.  Can I add your Reviewed-by or Tested-
> > by?
> 
> I haven't seen the other patch so Reviewed-by seems like the wrong
> thing.  I don't really need any sort of credit.  I'm just going through
> my backlog of warnings from being out of office.  Perhaps Reported-by?

That works.  FYI, your solution and Thiago's are exactly the same.[1]

Mimi

[1] https://lore.kernel.org/linux-integrity/8736ico5ax.fsf@morokweng.localdomain/T/#u
