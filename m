From: David Howells <dhowells@redhat.com>
Date: Wed, 03 Jul 2019 13:57:41 +0000
Subject: Re: [PATCH -next] integrity: Remove set but not used variable 'acl'
Message-Id: <15691.1562162261@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190703025518.6379-1-yuehaibing@huawei.com>
In-Reply-To: <20190703025518.6379-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: dhowells@redhat.com, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Kairui Song <kasong@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Mimi Zohar <zohar@linux.ibm.com>, Thiago Jung Bauermann <bauerman@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>, Eric Biggers <ebiggers@google.com>, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

YueHaibing <yuehaibing@huawei.com> wrote:

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> security/integrity/digsig.c: In function 'integrity_init_keyring':
> security/integrity/digsig.c:99:18: warning:
>  variable 'acl' set but not used [-Wunused-but-set-variable]
> 
> It seems 'acl' is needed in __integrity_init_keyring

I've folded this fix in, thanks.

David
