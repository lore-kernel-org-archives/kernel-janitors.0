From: jiangyiwen <jiangyiwen@huawei.com>
Date: Fri, 09 Feb 2018 07:10:46 +0000
Subject: [V9fs-developer] [RFC] we should solve create-unlink-getattr idiom
Message-Id: <5A7D4976.6060407@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Van Hensbergen <ericvh@gmail.com>, Greg Kurz <groug@kaod.org>, v9fs-developer@lists.sourceforge.net, qemu-devel@nongnu.org
Cc: aneesh.kumar@linux.vnet.ibm.com, Ron Minnich <rminnich@sandia.gov>, Latchesar Ionkov <lucho@ionkov.net>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Veaceslav Falico <veaceslav.falico@huawei.com>

Hi Eric and Greg,

I encountered the similar problem with create-unlink-getattr idiom.
I use the testcase that create-unlink-setattr idiom, and I see the
bug is reported at https://bugs.launchpad.net/qemu/+bug/1336794.
Then I also see you already fix the issue and push the patch to upstream.
https://github.com/ericvh/linux/commit/eaf70223eac094291169f5a6de580351890162a2
http://patchwork.ozlabs.org/patch/626194/

Unfortunately, the two patches are not merged into master, I don't know
the reason, so I suggest if the patche can be merged into master, and
it will solve the create-unlink-getattr idiom.

Thanks,
Yiwen

