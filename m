From: "J. Bruce Fields" <bfields@fieldses.org>
Date: Fri, 16 Jun 2017 13:50:35 +0000
Subject: Re: [PATCH] reconnect_one(): fix a missing error code
Message-Id: <20170616135035.GB12030@fieldses.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170614093002.GG29394@elgon.mountain>
 <20170614203414.GC32208@fieldses.org>
 <87lgou6xqm.fsf@notabene.neil.brown.name>
 <20170615214002.GA6195@fieldses.org>
 <87injw7unk.fsf@notabene.neil.brown.name>
In-Reply-To: <87injw7unk.fsf@notabene.neil.brown.name>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: NeilBrown <neilb@suse.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, "J. Bruce Fields" <bfields@redhat.com>, David Howells <dhowells@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jun 16, 2017 at 08:28:31AM +1000, NeilBrown wrote:
> It wouldn't be too hard to create that scenario.  It might be harder to
> find a way to expose the corruption.

Yes.  Well, in any case, I assume this Al's to take.  ACK to the patch,
and it should go to stable as well.

--b.
