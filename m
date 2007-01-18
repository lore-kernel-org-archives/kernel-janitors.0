From: "=?UTF-8?Q?H=C3=A5kon_L=C3=B8vdal?=" <hlovdal@gmail.com>
Date: Thu, 18 Jan 2007 19:43:34 +0000
Subject: Re: [KJ] a quick and dirty doc fixup job, if someone wants it
Message-Id: <a01a16b50701181143n1a1be5b9i4cdd543992b44441@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701181101350.21156@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0701181101350.21156@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 18/01/07, Robert P. J. Day <rpjday@mindspring.com> wrote:> 1) Absolutely=
 minimal software requirements for building the kernel,> along with their v=
ersion numbers:>>         - gcc>         - GNU make>         - binutils>   =
      - ...
It would also be nice if tests for these were integrated andmoved into the =
makefile (or test scripts called from the makefile).
The following is a very naive and incomplete test for gcc versionbut you ge=
t the idea:
gcc_version=3D`gcc --version | sed -n '1s/.*(GCC) \([^ ]*\) .*/\1/p'`case $=
gcc_versionin        2.*)                echo "Your compiler version ($gcc_=
version) is too old"                exit 1                ;;        4.*)   =
             echo "Exellent choice of compiler version ($gcc_version)"     =
           ;; # OK        *)                echo "Unhandled compiler versio=
n ($gcc_version), assuming OK"                ;;esac
BR H=E5kon L=F8vdal
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
