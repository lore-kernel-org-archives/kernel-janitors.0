From: David Howells <dhowells@redhat.com>
Date: Mon, 24 Nov 2014 13:42:23 +0000
Subject: Re: [patch] KEYS: remove a bogus NULL check
Message-Id: <16495.1416836543@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141122184201.GE6994@mwanda>
In-Reply-To: <20141122184201.GE6994@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> We already checked if "desc" was NULL at the beginning of the function
> and we've dereferenced it so this causes a static checker warning.

Yeah - keys were originally allowed to have no description.

Applied.
