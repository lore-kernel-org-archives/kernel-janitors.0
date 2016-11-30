From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 30 Nov 2016 21:55:45 +0000
Subject: Re: [patch] ACPI / CPPC: set an error code on probe error path
Message-Id: <CAJZ5v0gkSTbgEi2o8jySLPZvigcf0mWAG-B4t-abo=cR80aR2w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161130192254.GE28180@mwanda> <CAJZ5v0h06CXGzdAt=ZmB+pnWRumDGiic-eEpyLAojKVUVrJnnw@mail.gmail.com>
In-Reply-To: <CAJZ5v0h06CXGzdAt=ZmB+pnWRumDGiic-eEpyLAojKVUVrJnnw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Nov 30, 2016 at 10:53 PM, Rafael J. Wysocki <rafael@kernel.org> wrote:
> On Wed, Nov 30, 2016 at 8:22 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>> We should return -EINVAL if get_cpu_device() fails.
>>
>> Fixes: 158c998ea44b ("ACPI / CPPC: add sysfs support to compute delivered performance")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>
>> diff --git a/drivers/acpi/cppc_acpi.c b/drivers/acpi/cppc_acpi.c
>> index d0d0504..e0ea8f5 100644
>> --- a/drivers/acpi/cppc_acpi.c
>> +++ b/drivers/acpi/cppc_acpi.c
>> @@ -784,8 +784,10 @@ int acpi_cppc_processor_probe(struct acpi_processor *pr)
>>
>>         /* Add per logical CPU nodes for reading its feedback counters. */
>>         cpu_dev = get_cpu_device(pr->id);
>> -       if (!cpu_dev)
>> +       if (!cpu_dev) {
>> +               ret = -EINVAL;
>
> ret is initialized here AFAICS.
>
> Do you that its value is not the right one?

This was supposed to be "Do you mean that ...", sorry.

>
>>                 goto out_free;
>> +       }
>>
>>         ret = kobject_init_and_add(&cpc_ptr->kobj, &cppc_ktype, &cpu_dev->kobj,
>>                         "acpi_cppc");
>> --

Thanks,
Rafael
