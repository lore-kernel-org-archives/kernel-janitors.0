From: James Morris <jmorris@namei.org>
Date: Wed, 07 Mar 2012 00:13:45 +0000
Subject: Re: [Keyrings] [PATCH] KEYS: testing wrong bit for KEY_FLAG_REVOKED
Message-Id: <alpine.LRH.2.02.1203071113170.24515@tundra.namei.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 6 Mar 2012, David Howells wrote:

> From: Dan Carpenter <dan.carpenter@oracle.com>
> 
> The test for "if (cred->request_key_auth->flags & KEY_FLAG_REVOKED) {"
> should actually testing that the (1 << KEY_FLAG_REVOKED) bit is set.
> The current code actually checks for KEY_FLAG_DEAD.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: David Howells <dhowells@redhat.com>

Applied to
git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/linux-security.git next


-- 
James Morris
<jmorris@namei.org>
