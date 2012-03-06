From: David Howells <dhowells@redhat.com>
Date: Tue, 06 Mar 2012 11:22:33 +0000
Subject: Re: [patch] KEYS: testing wrong bit for KEY_FLAG_REVOKED
Message-Id: <15205.1331032953@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120305082902.GA10894@elgon.mountain>
In-Reply-To: <20120305082902.GA10894@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The test for "if (cred->request_key_auth->flags & KEY_FLAG_REVOKED) {"
> should actually be "if (test_bit(KEY_FLAG_REVOKED, &req_key->flags)) {".
> The current code actually checks for KEY_FLAG_DEAD.

Looks okay.

> The patch is really a one liner but I introduced a new variable so that
> I don't go over the 80 character limit.

Just split the arguments for test_bit() onto separate lines.

David
