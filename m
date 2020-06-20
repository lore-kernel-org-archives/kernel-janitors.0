From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 20 Jun 2020 08:30:54 +0000
Subject: Re: [PATCH] perf list: Fix memory leak in print_sdt_events()
Message-Id: <83ebb281-ffb5-483e-fba7-7278fc621af1@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wei Li <liwei391@huawei.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@redhat.com>, Mark Rutland <mark.rutland@arm.com>, Namhyung Kim <namhyung@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Hanjun Guo <guohanjun@huawei.com>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>

> Valgrind check info:

I suggest to improve this change description a bit.

* Would an additional imperative wording be nice
  (despite of the presented “leak summary”)?
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=4333a9b0b67bb4e8bcd91bdd80da80b0ec151162#n151

* Will the tag “Fixes” become helpful for the commit message?

Regards,
Markus
