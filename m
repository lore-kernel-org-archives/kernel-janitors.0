From: Arnaldo Carvalho de Melo <acme@kernel.org>
Date: Mon, 30 Apr 2018 13:52:56 +0000
Subject: Re: [PATCH] perf vendor events: fix spelling mistake: "alloacated" -> "allocated"
Message-Id: <20180430135256.GA3557@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180427185206.16347-1-colin.king@canonical.com>
In-Reply-To: <20180427185206.16347-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Ingo Molnar <mingo@redhat.com>, Andi Kleen <andi@firstfloor.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Em Fri, Apr 27, 2018 at 07:52:06PM +0100, Colin King escreveu:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Trivial fix to spelling mistakes in json text strings

These files are generated from other files, so any future update to them
will bring back the spelling mistakes, so, as Andi pointed out
previously, we better fix the spellings in the original files,
maintained by Intel.

- Arnaldo
 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  tools/perf/pmu-events/arch/x86/nehalemep/cache.json     | 4 ++--
>  tools/perf/pmu-events/arch/x86/nehalemex/cache.json     | 4 ++--
>  tools/perf/pmu-events/arch/x86/westmereep-dp/cache.json | 4 ++--
>  tools/perf/pmu-events/arch/x86/westmereep-sp/cache.json | 4 ++--
>  tools/perf/pmu-events/arch/x86/westmereex/cache.json    | 4 ++--
>  5 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/tools/perf/pmu-events/arch/x86/nehalemep/cache.json b/tools/perf/pmu-events/arch/x86/nehalemep/cache.json
> index a11029efda2f..c20ff6b3cb9d 100644
> --- a/tools/perf/pmu-events/arch/x86/nehalemep/cache.json
> +++ b/tools/perf/pmu-events/arch/x86/nehalemep/cache.json
> @@ -333,7 +333,7 @@
>          "UMask": "0x7",
>          "EventName": "L2_LINES_IN.ANY",
>          "SampleAfterValue": "100000",
> -        "BriefDescription": "L2 lines alloacated"
> +        "BriefDescription": "L2 lines allocated"
>      },
>      {
>          "EventCode": "0xF1",
> @@ -3226,4 +3226,4 @@
>          "BriefDescription": "Offcore prefetch requests that HITM in a remote cache",
>          "Offcore": "1"
>      }
> -]
> \ No newline at end of file
> +]
> diff --git a/tools/perf/pmu-events/arch/x86/nehalemex/cache.json b/tools/perf/pmu-events/arch/x86/nehalemex/cache.json
> index 21a0f8fd057e..79f7120c50a5 100644
> --- a/tools/perf/pmu-events/arch/x86/nehalemex/cache.json
> +++ b/tools/perf/pmu-events/arch/x86/nehalemex/cache.json
> @@ -333,7 +333,7 @@
>          "UMask": "0x7",
>          "EventName": "L2_LINES_IN.ANY",
>          "SampleAfterValue": "100000",
> -        "BriefDescription": "L2 lines alloacated"
> +        "BriefDescription": "L2 lines allocated"
>      },
>      {
>          "EventCode": "0xF1",
> @@ -3181,4 +3181,4 @@
>          "BriefDescription": "Offcore prefetch requests that HITM in a remote cache",
>          "Offcore": "1"
>      }
> -]
> \ No newline at end of file
> +]
> diff --git a/tools/perf/pmu-events/arch/x86/westmereep-dp/cache.json b/tools/perf/pmu-events/arch/x86/westmereep-dp/cache.json
> index 6e61ae20d01a..08fa9ebf056a 100644
> --- a/tools/perf/pmu-events/arch/x86/westmereep-dp/cache.json
> +++ b/tools/perf/pmu-events/arch/x86/westmereep-dp/cache.json
> @@ -213,7 +213,7 @@
>          "UMask": "0x7",
>          "EventName": "L2_LINES_IN.ANY",
>          "SampleAfterValue": "100000",
> -        "BriefDescription": "L2 lines alloacated"
> +        "BriefDescription": "L2 lines allocated"
>      },
>      {
>          "EventCode": "0xF1",
> @@ -2814,4 +2814,4 @@
>          "BriefDescription": "REQUEST = PREFETCH and RESPONSE = REMOTE_CACHE_HITM",
>          "Offcore": "1"
>      }
> -]
> \ No newline at end of file
> +]
> diff --git a/tools/perf/pmu-events/arch/x86/westmereep-sp/cache.json b/tools/perf/pmu-events/arch/x86/westmereep-sp/cache.json
> index dad20f0e3cac..be612cda6b68 100644
> --- a/tools/perf/pmu-events/arch/x86/westmereep-sp/cache.json
> +++ b/tools/perf/pmu-events/arch/x86/westmereep-sp/cache.json
> @@ -213,7 +213,7 @@
>          "UMask": "0x7",
>          "EventName": "L2_LINES_IN.ANY",
>          "SampleAfterValue": "100000",
> -        "BriefDescription": "L2 lines alloacated"
> +        "BriefDescription": "L2 lines allocated"
>      },
>      {
>          "EventCode": "0xF1",
> @@ -3230,4 +3230,4 @@
>          "BriefDescription": "Offcore prefetch requests that HITM in a remote cache",
>          "Offcore": "1"
>      }
> -]
> \ No newline at end of file
> +]
> diff --git a/tools/perf/pmu-events/arch/x86/westmereex/cache.json b/tools/perf/pmu-events/arch/x86/westmereex/cache.json
> index f9bc7fdd48d6..c5896ed6542c 100644
> --- a/tools/perf/pmu-events/arch/x86/westmereex/cache.json
> +++ b/tools/perf/pmu-events/arch/x86/westmereex/cache.json
> @@ -213,7 +213,7 @@
>          "UMask": "0x7",
>          "EventName": "L2_LINES_IN.ANY",
>          "SampleAfterValue": "100000",
> -        "BriefDescription": "L2 lines alloacated"
> +        "BriefDescription": "L2 lines allocated"
>      },
>      {
>          "EventCode": "0xF1",
> @@ -3222,4 +3222,4 @@
>          "BriefDescription": "Offcore prefetch requests that HITM in a remote cache",
>          "Offcore": "1"
>      }
> -]
> \ No newline at end of file
> +]
> -- 
> 2.17.0
