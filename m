From: Vasiliy Kulikov <segooon@gmail.com>
Date: Wed, 28 Jul 2010 17:04:28 +0000
Subject: coccinelle script for correct handling of return values of
Message-Id: <20100728170428.GA23707@albatros>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi folks,

I'm currently working on this task:
http://kernelnewbies.org/KernelJanitors/Todo/ReturnCodes

I think this task can be partly done with coccinelle. The most often cases of
invalid handling is no handling :)

I am not guru of coccinelle, but I think it is very useful here. So,
I've written basic script of finding common errors, but it is not ideal.
Some trivial "metamorphisms" can be added, like this:

if (!x) ...

is equivalent in our case to

if (unlikely(!x)) ...

likely(), unlikely(), WARN(), some_driver_defined_assert(), etc.

Currently script finds ~400 patterns in linux-next, some of them are
false positive. Even if there were no false positives it is a rather
long process :)


So, I'm calling for help in raking this mess and improving the script.


// These are checks for allocation function, only comparation with 0 is ok
@@
identifier x;
identifier f ~= "request_region$\|kmalloc$\|vmalloc$\|pci_map_.*$\|get_free_pages$\|get_free_page$\|ioremap$\|create_proc_.*$";
statement S1, S2;
@@

\(
*x = f(...);
 ...
     when != if (x) S1 else S2
     when != if (x = 0) S1 else S2
     when != if (x = NULL) S1 else S2
     when != if (x != 0) S1 else S2
     when != if (x != NULL) S1 else S2
     when != if (!x) S1 else S2
     when != return x;
\|
*f(...);
\)

// These are checks for functions that return 0 on success and smth <0 on error
// Result can be checked as (ret = 0), (ret < 0) and as (ret >= 0)
@@
identifier x;
identifier f ~= "request_irq$\|register_netdev$\|misc_register$\|scsi_register$\|put_user$\|get_user$\|kernel_thread$";
statement S1, S2;
@@

\(
*x = f(...);
 ...
     when != if (x < 0) S1 else S2
     when != if (x >= 0) S1 else S2
     when != if (x != 0) S1 else S2
     when != if (!x) S1 else S2
     when != if (x = 0) S1 else S2
     when != return x;
\|
*f(...);
\)

// These are function returning 0 on success and positive (!!!) result on error
// Result can be checked as (ret = 0), (ret > 0)
//
@@
identifier x;
identifier f ~= "copy_to_user$\|copy_from_user$";
statement S1, S2;
@@

\(
*x = f(...);
 ...
     when != if (x) S1 else S2
     when != if (!x) S1 else S2
     when != if (x > 0) S1 else S2
     when != return x;
\|
*f(...);
\)


Thanks,
Vasiliy.
