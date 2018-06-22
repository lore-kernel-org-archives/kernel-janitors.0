From: David Howells <dhowells@redhat.com>
Date: Fri, 22 Jun 2018 11:15:15 +0000
Subject: Re: [PATCH] hugetlbfs: Fix an error code in init_hugetlbfs_fs()
Message-Id: <18326.1529666115@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180620110921.2s4krw4zjbnfniq5@kili.mountain>
In-Reply-To: <20180620110921.2s4krw4zjbnfniq5@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: dhowells@redhat.com, Mike Kravetz <mike.kravetz@oracle.com>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> We accidentally deleted the error code assignment.

Thanks.  I'll fold it into the original patch.

David
