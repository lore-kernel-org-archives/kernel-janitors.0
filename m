From: Jesse Millan <jessem@cs.pdx.edu>
Date: Thu, 19 May 2005 05:42:12 +0000
Subject: [KJ] (Re: Fix gcc 4 warnings) error: incomplete array element type
Message-Id: <428C2734.7060501@cs.pdx.edu>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


GCC 4 is rejecting decorations like the following:

[root@sc]# cat test.c

int main()
{
        extern struct foo array_foo[];
        return;
}

[root@sc]# /usr/local/gcc4/bin/gcc test.c
test.c: In function 'main':
test.c:4: error: array type has incomplete element type

I was in the process of building kernel linux-2.6.11.10 using gcc4 when
came across such a decoration (include/linux/i2c.h:58) and failed.

I am sure that this is the first of many such declarations that are
scattered in the kernel.

I have found that "incomplete array element type declarations" are not
supposed to be valid. However, gcc3 did not complain about them.

I some discussion on the gcc mailing list:

http://gcc.gnu.org/ml/gcc/2005-02/msg00054.html

Changing the declaration like so makes the errors go away:

int main()
{
        extern struct foo * array_foo;
        return;
}

Should I post patches that make this change as I come across them?

-- 
Jesse Millan
CNS Unix Team
Portland State University
Phone: (503) 725-9151
Mobile: (503) 453-0748
GPG key: www.system-calls.com/gpg.php
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
