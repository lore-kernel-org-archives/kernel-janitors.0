From: David Howells <dhowells@redhat.com>
Date: Thu, 12 Jan 2017 13:08:33 +0000
Subject: Re: [patch] KEYS: Fix an error code in request_master_key()
Message-Id: <11899.1484226513@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1481907033.17553.78.camel@linux.vnet.ibm.com> <20161216090827.GA7285@elgon.mountain>
In-Reply-To: <1481907033.17553.78.camel@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mimi Zohar <zohar@linux.vnet.ibm.com>
Cc: dhowells@redhat.com, Dan Carpenter <dan.carpenter@oracle.com>, David Safford <safford@us.ibm.com>, James Morris <james.l.morris@oracle.com>, "Serge E. Hallyn" <serge@hallyn.com>, linux-security-module@vger.kernel.org, keyrings@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Mimi Zohar <zohar@linux.vnet.ibm.com> wrote:

> On Fri, 2016-12-16 at 12:08 +0300, Dan Carpenter wrote:
> > This function has two callers and neither are able to handle a NULL
> > return.  Really, -EINVAL is the correct thing return here anyway.  This
> > fixes some static checker warnings like:
> > 
> > 	security/keys/encrypted-keys/encrypted.c:709 encrypted_key_decrypt()
> > 	error: uninitialized symbol 'master_key'.
> > 
> > Fixes: 7e70cb497850 ("keys: add new key-type encrypted")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Thanks!

Can I put that down as an Acked-by or Reviewed-by?

David
