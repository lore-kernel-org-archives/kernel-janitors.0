From: Wei Yang <richardw.yang@linux.intel.com>
Date: Thu, 10 Oct 2019 03:53:14 +0000
Subject: Re: [PATCH -next] userfaultfd: remove set but not used variable 'h'
Message-Id: <20191010035314.GA6917@richard>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191009122740.70517-1-yuehaibing@huawei.com>
 <a28da32b-5c26-21e9-4a08-722abf9fbeba@oracle.com>
 <20191010012322.GB2167@richard>
 <ba62cc8f-da4d-a316-c968-80871551c863@oracle.com>
 <20191010033045.GA5927@richard>
 <01601a94-5c52-7ef6-ce08-7a86ac70fab2@oracle.com>
In-Reply-To: <01601a94-5c52-7ef6-ce08-7a86ac70fab2@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Mike Kravetz <mike.kravetz@oracle.com>
Cc: Wei Yang <richardw.yang@linux.intel.com>, YueHaibing <yuehaibing@huawei.com>, Andrea Arcangeli <aarcange@redhat.com>, "Joel Fernandes (Google)" <joel@joelfernandes.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Hugh Dickins <hughd@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Oct 09, 2019 at 08:42:46PM -0700, Mike Kravetz wrote:
>On 10/9/19 8:30 PM, Wei Yang wrote:
>> On Wed, Oct 09, 2019 at 07:25:18PM -0700, Mike Kravetz wrote:
>>> On 10/9/19 6:23 PM, Wei Yang wrote:
>>>> On Wed, Oct 09, 2019 at 05:45:57PM -0700, Mike Kravetz wrote:
>>>>> On 10/9/19 5:27 AM, YueHaibing wrote:
>>>>>> Fixes gcc '-Wunused-but-set-variable' warning:
>>>>>>
>>>>>> mm/userfaultfd.c: In function '__mcopy_atomic_hugetlb':
>>>>>> mm/userfaultfd.c:217:17: warning:
>>>>>>  variable 'h' set but not used [-Wunused-but-set-variable]
>>>>>>
>>>>>> It is not used since commit 78911d0e18ac ("userfaultfd: use vma_page=
size
>>>>>> for all huge page size calculation")
>>>>>>
>>>>>
>>>>> Thanks!  That should have been removed with the recent cleanups.
>>>>>
>>>>>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>>>>>
>>>>> Reviewed-by: Mike Kravetz <mike.kravetz@oracle.com>
>>>>
>>>> If I am correct, this is removed in a recent patch.
>>>
>>> I'm having a hard time figuring out what is actually in the latest mmotm
>>> tree.  Andrew added a build fixup patch ab169389eb5 in linux-next which
>>> adds the reference to h.  Is there a patch after that to remove the ref=
erence?
>>>
>>=20
>> I checked linux-next tree, this commit removes the reference.
>>=20
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/comm=
it/?id=ADd4eaeef3766b7491d70d473c48c0b6d6ca5cb7
>>=20
>
>Yes, but unless I am mistaken this adds it back,
>
>https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit=
/?id=AB169389eb5ff9da7113a21737574edc6d22c072
>

Oops, we may leave this to Andrew.

>--=20
>Mike Kravetz

--=20
Wei Yang
Help you, Help me
