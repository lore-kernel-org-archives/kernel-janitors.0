From: "rae l" <crquan@gmail.com>
Date: Fri, 25 Jul 2008 17:08:38 +0000
Subject: Re: [PATCH 2/5] drivers/scsi/aic94xx/: replace __FUNCTION__ with __func__
Message-Id: <91b13c310807251008o361bc39drfb6aa227cd9fd2f9@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1216954114-31949-1-git-send-email-crquan@gmail.com>
	 <20080725164253.GA7355@tree.beaverton.ibm.com>
In-Reply-To: <20080725164253.GA7355@tree.beaverton.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: djwong@us.ibm.com
Cc: linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Jul 26, 2008 at 12:42 AM, Darrick J. Wong <djwong@us.ibm.com> wrote:
> On Fri, Jul 25, 2008 at 10:48:33AM +0800, Denis ChengRq wrote:
>> Signed-off-by: Denis ChengRq <crquan@gmail.com>
>
> No justification or changelog?
I think no more explanation needed, the subject is definite.

and no justification happened here, (there are justifications otherwhere)

>> -             __FUNCTION__)
>> +             __func__)
>
> include/linux/kernel.h:503:#define __FUNCTION__ (__func__)
This solution is not completely,

>
> I assume you're trying to kill this?
Eventually we will need a replace in the whole tree:

grep -RsInw __FUNCTION__ . |xargs sed -i -e 's/__FUNCTION__/__func__/g'
