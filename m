From: Jack Stone <jwjstone@fastmail.fm>
Date: Tue, 24 Mar 2009 13:10:18 +0000
Subject: x86 cpumask.h paravirt.h and sparse
Message-Id: <49C8DBBA.90305@fastmail.fm>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi all,

Running the following commands generates a lot of sparse warnings:

make distclean
make allyesconfig
make C=2

These warnings are mostly symbol '______f' shadows an earlier one.

I couldn't find anything mensioned in the archives for either this list
or lkml.

Are these a known problem and is anyone else working on it?

Thanks,

Jack
