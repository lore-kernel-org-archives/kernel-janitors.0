From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 09 Jan 2017 11:48:21 +0000
Subject: Re: VMCI: Use kmalloc_array() in qp_alloc_ppn_set()
Message-Id: <bce6662f-78bd-f53c-b552-5378f4298550@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9a04914a-138b-3f5d-b82a-8043b2602bd9@users.sourceforge.net>
 <20170109094006.GD7495@dhcp22.suse.cz>
In-Reply-To: <20170109094006.GD7495@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michal Hocko <mhocko@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, George Zhang <georgezhang@vmware.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> If there are more then I would suggest changing all of them at once
> along with the coccinelle program which has been used.

There are still hundreds of similar update candidates left over for
other software modules. The acceptance is varying for the proposed
refactoring by the involved developers and source code reviewers.

Regards,
Markus
