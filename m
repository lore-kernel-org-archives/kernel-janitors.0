From: James Morris <jmorris@namei.org>
Date: Tue, 11 Aug 2009 15:32:27 +0000
Subject: Re: [PATCH][RFC] security: constify seq_operations
Message-Id: <alpine.LRH.2.00.0908120129290.22015@tundra.namei.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.LRH.2.00.0908112337450.21218@tundra.namei.org> <20090811143643.GA15096@us.ibm.com>
In-Reply-To: <20090811143643.GA15096@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Serge E. Hallyn" <serue@us.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, Christoph Hellwig <hch@infradead.org>, Arjan van de Ven <arjan@infradead.org>, kernel-janitors@vger.kernel.org

On Tue, 11 Aug 2009, Serge E. Hallyn wrote:

> seq_ops structs not constified...  something as simple as
> find . -type f -print0 | xargs -0 grep 'struct seq_operations' | grep -v const
> Though what you have here hits all of those and more.

There might be some docs to update to get people to think about it.

> Acked-by: Serge Hallyn <serue@us.ibm.com>

Christoph kind of acked it off-list, but wasn't sure about the security: 
tag.  I suppose it could be seq_file: ?

-- 
James Morris
<jmorris@namei.org>
